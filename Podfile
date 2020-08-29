workspace '${POD_NAME}'
project 'Example/${POD_NAME}'

platform :ios, '12.0'
use_frameworks!

target '${POD_NAME}_Example' do
  pod '${POD_NAME}', :path => './'

  target '${POD_NAME}_Tests' do
    inherit! :search_paths

    ${INCLUDED_PODS}
  end
end

pre_install do |installer|
  `./scripts/install_git_hooks.sh`
end
