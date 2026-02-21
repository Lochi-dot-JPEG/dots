#!/usr/bin/env python3
from typing import List
import sys
import gi
gi.require_version("Playerctl", "2.0")
from gi.repository.Playerctl import Player
from gi.repository import Playerctl


class PlayerManager:
    def __init__(self, selected_player=None, excluded_player=[]):
        self.manager = Playerctl.PlayerManager()

        self.selected_player = selected_player
        self.excluded_player = excluded_player.split(
            ',') if excluded_player else []

        self.init_players()

    def init_players(self):
        for player in self.manager.props.player_names:
            if player.name in self.excluded_player:
                continue
            if self.selected_player is not None and self.selected_player != player.name:
                continue
            self.init_player(player)

    def init_player(self, player):
        player = Playerctl.Player.new_from_name(player)
        self.manager.manage_player(player)
        self.on_metadata_changed(player, player.props.metadata)

    def get_players(self) -> List[Player]:
        return self.manager.props.players

    def write_output(self, text):
        sys.stdout.write(text)

    def clear_output(self):
        sys.stdout.write("\n")

    def on_playback_status_changed(self, player, status, _=None):
        self.on_metadata_changed(player, player.props.metadata)

    def get_first_playing_player(self):
        players = self.get_players()
        if len(players) > 0:
            # if any are playing, show the first one that is playing
            # reverse order, so that the most recently added ones are preferred
            for player in players[::-1]:
                if player.props.status == "Playing":
                    return player
            # if none are playing, show the first one
            return players[0]
        else:
            return None

    def show_most_important_player(self):
        # show the currently playing player
        # or else show the first paused player
        # or else show nothing
        current_player = self.get_first_playing_player()
        if current_player is not None:
            self.on_metadata_changed(
                current_player, current_player.props.metadata)
        else:
            self.clear_output()

    def on_metadata_changed(self, player, metadata, _=None):
        player_name = player.props.player_name
        artist = player.get_artist()
        title = player.get_title()
        title = title.replace("&", "&amp;")

        track_info = ""
        if player_name == "spotify" and "mpris:trackid" in metadata.keys() and ":ad:" in player.props.metadata["mpris:trackid"]:
            track_info = "Advertisement"
        elif artist is not None and title is not None:
            track_info = f"{artist} - {title}"
        else:
            track_info = title

        if track_info:
            if player.props.status == "Playing":
                track_info = "" + track_info
            else:
                track_info = ""
        # only print output if no other player is playing
        current_playing = self.get_first_playing_player()
        if current_playing is None or current_playing.props.player_name == player.props.player_name:
            self.write_output(track_info)

    def on_player_appeared(self, _, player):
        if player.name in self.excluded_player:
            return
        if player is not None and (self.selected_player is None or player.name == self.selected_player):
            self.init_player(player)

    def on_player_vanished(self, _, player):
        self.show_most_important_player()


def main():
    PlayerManager()
    sys.stdout.write("\n")
    sys.stdout.flush()
    sys.exit(0)


if __name__ == "__main__":
    main()
