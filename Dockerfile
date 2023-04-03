# Based on the latest version of the alpine image
FROM alpine:latest 

# Responsible
MAINTAINER Parker Hemphill

# Updates the package index and installs python3 in the alpine container
RUN apk --update add bash python3 py3-pip

# Adds required python packages
RUN pip install pyemvue

# Copies the update_creds file to the image
ADD update_creds /opt/update_creds

# Set default docker variables
ENV emporia_username=${emporia_username:-NULL}
ENV emporia_password=${emporia_password:-NULL}
ENV hubitat_ip=${hubitat_ip:-NULL}
ENV maker_api_id=${maker_api_id:-NULL}
ENV maker_api_token=${maker_api_token:-NULL}

CMD python3 /opt/update_creds ${emporia_username} ${emporia_password} ${emporia_device_id} ${hubitat_ip} ${maker_api_id} ${maker_api_token}
