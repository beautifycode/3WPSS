dim spotifyhelper
set spotifyhelper = WScript.CreateObject("SpotifyAPI.Local.SpotifyLocalAPI")
spotifyhelper.Connect
spotifyhelper.PlayURL WScript.Arguments(0)
