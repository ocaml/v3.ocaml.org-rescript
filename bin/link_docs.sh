#!/bin/sh

set -ex

if [ ! -e alldocs ]; then
	echo "Cloning docs repository into 'alldocs'"
	git clone https://github.com/jonludlam/html-tailwind alldocs > /dev/null
fi

cd alldocs

# Find the current live branch
git checkout origin/live

LIVE_BRANCH=$(cat live)

echo "Live branch is: $LIVE_BRANCH"

echo "Updating live branch"
git checkout $LIVE_BRANCH
git pull origin $LIVE_BRANCH 

rm -f checkout_cmd.sh

echo "git branch -D local-$LIVE_BRANCH" > checkout_cmd.sh
echo "git checkout main" >> checkout_cmd.sh
echo "git checkout -b local-$LIVE_BRANCH" >> checkout_cmd.sh

for i in *; do
  commit=$(cat $i)
  echo "git merge -m . $commit" >> checkout_cmd.sh
done

/bin/sh checkout_cmd.sh

cd ../public
ln -sf ../alldocs/content/packages .
ln -sf ../alldocs/content/universes .



