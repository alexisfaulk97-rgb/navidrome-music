# Use the official Navidrome image
FROM deluan/navidrome:latest

# Prepare temp and target folders
RUN mkdir -p /tmp/repo_music /home/navidrome/data /home/navidrome/music

# Copy repo music into a temporary location inside the image
COPY music /tmp/repo_music

# Add init script
COPY init-copy.sh /init-copy.sh
RUN chmod +x /init-copy.sh

# Ensure safe permissions
RUN chown -R app:app /home/navidrome /tmp/repo_music || true

# Make the init script the entrypoint
ENTRYPOINT ["/init-copy.sh"]

# Expose port (Render handles routing)
EXPOSE 4533
