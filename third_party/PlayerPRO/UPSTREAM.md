# PlayerPRO source subset

Source: https://github.com/MaddTheSane/PlayerPRO
Commit: 0a07010443053f54636adcd2d0460d1196a6fd88

Only the mixer, effects, MADH decoder and required headers are included. Upstream files are preserved; portable build fixes and the Blitz-specific 30/70 panning adaptation are generated in build/playerpro by native/build_playerpro.py. Original author Antoine Rosset released PlayerPRO to the public domain; see LICENSE.txt.
