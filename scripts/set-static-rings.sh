set -e -u -x

# For ease of deployment we are using static rings that were built
# specifically for this use case


# Create /etc/hummingbird 
DIR="/etc/hummingbird"
if [ -d "$DIR" ]; then
    mkdir -p /etc/hummingbird
fi

# Copy static rings to /etc/hummingbird
cp tests/ring/*.ring.gz /etc/hummingbird

