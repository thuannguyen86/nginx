# vi:filetype=perl

use lib 'lib';
use Test::Nginx::Socket;

plan tests => $Test::Nginx::Socket::RepeatEach * 2 * blocks();

no_diff;

run_tests();

__DATA__

=== TEST 1: off & POST
--- config
    chunkin on;
    location /ar.do {
        echo_request_body;
    }
--- more_headers
Transfer-Encoding: chunked
--- request eval
"POST /ar.do
1b9\r
".'%Q`3ï¿½BBT0123456789AF%Q_ï¿½k%Q_ï¿½kwtk-emulatorSunMicrosystems_wtk AX7`encoding=pcm encoding=pcm&rate=8000&bits=8&channels=1 encoding=pcm&rate=22050&bits=16&chanZach-Laptop-W1.01.0en-US1.01.11.11.0SunMicrosystems_wtMIDP-2.11.0.10H,1Haudio/x-wavtruetruetruetruenencoding=rgb565&width=160&height=120 encoding=rgb565&width=320&height=240 encoding=rgb565&width=120&height=160encoding=jpeg encoding=png+12345678900http://mmsc.127.0.0.01'."\r
0\r
\r
"
--- response_body eval
'%Q`3ï¿½BBT0123456789AF%Q_ï¿½k%Q_ï¿½kwtk-emulatorSunMicrosystems_wtk AX7`encoding=pcm encoding=pcm&rate=8000&bits=8&channels=1 encoding=pcm&rate=22050&bits=16&chanZach-Laptop-W1.01.0en-US1.01.11.11.0SunMicrosystems_wtMIDP-2.11.0.10H,1Haudio/x-wavtruetruetruetruenencoding=rgb565&width=160&height=120 encoding=rgb565&width=320&height=240 encoding=rgb565&width=120&height=160encoding=jpeg encoding=png+12345678900http://mmsc.127.0.0.01'
