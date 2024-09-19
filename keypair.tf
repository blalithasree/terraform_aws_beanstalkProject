resource "aws_key_pair" "lalithakey" {
  key_name   = "lalitha"
  public_key = file(var.PUB_KEY_PATH)

}