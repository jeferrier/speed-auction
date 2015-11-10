# For amazon S3 and etc.
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/speed-auction/:class/:filename'