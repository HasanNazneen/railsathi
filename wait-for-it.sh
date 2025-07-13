
set -e

host="$1"
port="$2"
shift 2
cmd="$@"

echo "Waiting for $host:$port to be available..."

while ! nc -z "$host" "$port"; do
  echo "Still waiting for $host:$port..."
  sleep 1
done

echo "$host:$port is available. Running command: $cmd"
exec $cmd
