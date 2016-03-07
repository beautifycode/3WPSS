dim spotifyhelper
set spotifyhelper = WScript.CreateObject("SpotifyAPI.Local.SpotifyLocalAPI")
spotifyhelper.Connect
spotifyhelper.PlayURL "path-to-uri"
