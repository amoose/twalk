# Get the deployed git revision and version
# thanks to: http://houseofding.com/2013/11/display-git-revision-in-your-application/
module Git
  REVISION = File.exists?(File.join(Rails.root, 'REVISION')) ? File.open(File.join(Rails.root, 'REVISION'), 'r') { |f| GIT_REVISION = f.gets.chomp } : `SHA1=$(git rev-parse --short HEAD 2> /dev/null); if [ $SHA1 ]; then echo $SHA1; else echo 'unknown'; fi`.chomp
  VERSION = File.exists?(File.join(Rails.root, 'VERSION')) ? File.open(File.join(Rails.root, 'VERSION'), 'r') { |f| GIT_VERSION = f.gets.chomp } : `VERSION=$(git describe --tags 2> /dev/null); if [ $VERSION ]; then echo $VERSION; else echo 'unknown'; fi`.chomp
end
