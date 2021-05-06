def blob_for(name)
  ActiveStorage::Blob.create_after_upload!(
    io: File.open("app/assets/images/#{name}"),
    filename: name,
    content_type: 'image/jpeg' # Or figure it out from `name` if you have non-JPEGs
  )
end