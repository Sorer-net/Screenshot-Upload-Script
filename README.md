# Screenshot-Upload-Script


## On Screenshot:

### - Creates temp file.
### - Activates Flameshot demanding it outputs image into temp file.
### - Checks for Flameshot output, if other than image - removes temp file and notifies user.
### - Sets image_id to be the return value of a post request with the image.
### - Echo's image_id to console.
### - Checks for valid UUID length (image_id).
### - If length is valid: copies image link to clipboard and notifies user.
### - Otherwise: Copies image to clipboard and notifies user.
