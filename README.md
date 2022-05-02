
# SSH Rsync CI/CD Action
Github Action enables rsync assets transfer to server
## Input values
- Private server key (RSA format recommended)
- Host - ipv4 format address
- Username
- Hostname - (example.com)
- Server path - (www/)


## Workflow usage
If the action is private, clone the action to the ./github directory
```
/.github
    |-> actions
        |-> sshrsync-ation
```
```
- uses: ./.github/actions/sshrsync-action
    with:
        privkey: ${{secrets.PRIV_KEY}}
        host: "255.255.255.255"
        username: "server-username"
        hostname: "example.com"
        options: "--exclude=.git --exclude=node_modules --exclude=.git*"
        serverpath: "public_html/path-to/server"
```

## Testing
Test action via command line
```
$> docker build -t [image_name] .
$> docker run [image_name] [private_key_string] [host] [username] [hostname] [options] [server_path]W
```