PCK_DIR='catalogue'

install:
	@echo "installing python requirements..."
	pip install -r requirements.txt

deploy_package:
	twine upload --repository fury dist/* --verbose

clean_package:
	rm -r dist || echo 'dist removed'
	rm -r ${PCK_DIR}.egg-info || echo 'egg-info removed'

build_package: clean_package
	python setup.py sdist

package: build_package deploy_package


