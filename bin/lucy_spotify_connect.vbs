dim spotifyhelper
set spotifyhelper = WScript.CreateObject("SpotifyAPI.Local.SpotifyLocalAPI")
spotifyhelper.Connect
spotifyhelper.Play WScript.Arguments(0)