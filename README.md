# my_portfolio

Flutter version 3.32.4  

upload to github pages of shafi munshi

flutter build web --release \
cd build/web \
git init \
git checkout -b gh-pages \
git remote add origin https://github.com/ShafiMunshi/My_Portfolio.git \
git add . \
git commit -m "deploy" \
git push -f origin gh-pages


Use this command to deploy: 

flutter build web --release --base-href "/My_Portfolio/"
peanut --extra-args "--release --base-href=/My_Portfolio/"
git push origin --set-upstream gh-pages
