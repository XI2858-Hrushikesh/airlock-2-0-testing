# Point 4: which base64 decode function name does the platform accept?
# "aW5zdHJ1cXQ=" is "instruqt".

local "b64_docs_spelling" {
  value = base64decode("aW5zdHJ1cXQ=")
}
