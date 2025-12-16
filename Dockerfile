FROM python:3.13-alpine

# Install Alpine requirements
RUN apk add --no-cache libmagic

# Install Python requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source to app directory
COPY . .

# Move config stubs
RUN find /settings -iname '*.txt' -exec sh -c 'mv -- "$1" "${1%.txt}.py"' sh {} \;

# Make sure run script is executable
RUN chmod +rxxx ./run.sh

CMD ["sh", "run.sh"]
