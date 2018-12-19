# Docker image for Phan, a static analyzer for PHP

Cf. https://github.com/phan/phan

# How to use it

    docker run --rm -it -v "$PWD:$PWD" -w "$PWD" -u "$(id -u):$(id -g)" tophfr/phan -p

You should probably edit `.phan/config.php`.
