FROM python:3.14-alpine

# Install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source to app directory
COPY . .

# Move config stubs
RUN find /settings -iname '*.txt' -exec bash -c 'mv -- "$1" "${1%.txt}.py"' bash {} \;

# Make sure run script is executable
RUN chmod +rxxx ./run.sh

CMD ["sh", "run.sh"]
