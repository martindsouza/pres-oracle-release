# Src Repo https://github.com/martindsouza/pres-oracle-release-demo 

cd ~/Documents/GitHub/martindsouza/pres-oracle-release-demo

# Demo Prep
# Delete remote tags
git tag -l | xargs -n 1 git push --delete origin
# Delete local tags
git tag | xargs git tag -d
# Drop views directory
git rm views/*
git commit -m "Demo prep"
git push
mkdir views



# New Release
cd release
touch _release.sql
touch issue-123.sql


# Open issue-123.sql
code issue-123.sql

# Add:

# prompt issue-123 START
# 
# -- Note: missing comma on purpose
# create table demo(
#   demo_id number
#   demo_code varchar2(123)
# );
# 
# prompt issue-123 END



# Open _release.sql
code _release.sql

# Add

# @issue-123.sql
# 
# -- Views
# @../views/v_emp.sql
# 
# -- Recompile Invalid Objects
# exec dbms_utility.compile_schema(schema => user,  compile_all => false);



# Commit code
git status
git add *
git commit -m "issue-123: Added demo table"
git push


# *** RELEASE CODE ***

# Create "Temp" branch to release code
GIT_REL_VER=1.0.0
GIT_PRE_REL_BRANCH=pre-$GIT_REL_VER

git branch $GIT_PRE_REL_BRANCH
git checkout $GIT_PRE_REL_BRANCH


# Now run the Release manually
cd release
code _release.sql


# Connect to Oracle and run manually
/oracle/sqlcl/bin/sqlcl giffy/giffy@localhost:9521/xepdb1


# View fixes
git status

# Should notice the change in issue-123
git add *
git commit -m "fix missing comma"


# Tag final version
git tag $GIT_REL_VER
git push origin --tags



# Merge changes back into master
# Get Master
git checkout master
# Look at issue-123 Note that it's the "invalid version"
git merge $GIT_PRE_REL_BRANCH
git push


# *** CLEANUP ***
# Delete pre-release tag
git branch -d $GIT_PRE_REL_BRANCH

# Delete /release folder
cd release
git rm *
# Start new release file
echo "PROMPT release" >> _release.sql
# commit so it's in git
git add _release.sql
# Final commit
git commit -m "Post release cleanup"
git push