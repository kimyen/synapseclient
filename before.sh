# setup variables

export PACKAGE_NAME=synapser

if [[ ${DEV_VERSION} ]]
then
	VERSION_LINE=`grep Version DESCRIPTION`
	DEV_VERSION_LINE=$VERSION_LINE.$DEV_VERSION
	sed "s|$VERSION_LINE|$DEV_VERSION_LINE|g" DESCRIPTION > DESCRIPTION.temp
	rm DESCRIPTION
	mv DESCRIPTION.temp DESCRIPTION
fi

export PACKAGE_VERSION=`grep Version DESCRIPTION | awk '{print $2}'`

# store the login credentials
echo "[authentication]" > orig.synapseConfig
echo "username=${USERNAME}" >> orig.synapseConfig
echo "apiKey=${APIKEY}" >> orig.synapseConfig
