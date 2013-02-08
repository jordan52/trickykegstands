# Produce HTML from all Markdown files in a directory
# Lincoln Mullen | http://lincolnmullen.com | lincoln@lincolnmullen.com
#
# Modified by Jordan Woerndle
#
# If you use the deploy target, be sure to specify S3BUCKET=trickykegstands.com
# so it s3cmd sync's to the proper bucket.
#
# Requires text files called header and footer which are appended and prepended
# to the converted markdown file. This, of course, assumes header and footer
# are valid html files.
#

MDDIR=src/site
RESOURCES=src/resources
OUTDIR=target
HTMLS= $(patsubst $(MDDIR)/%.md,$(OUTDIR)/%.html,$(wildcard $(MDDIR)/*.md))

# The all rule makes the HTML files and copies resources to the target. 

all : $(HTMLS) resources

resources :
	rsync -a $(RESOURCES)/* $(OUTDIR)/.

deploy :
	s3cmd sync --acl-public $(OUTDIR)/. s3://$(S3BUCKET)/

til :
	s3cmd sync --acl-public $(OUTDIR)/todayILearned.html s3://trickykegstands.com/

# This generic rule accepts HTML targets with corresponding Markdown 
# source, and makes them using pandoc
$(OUTDIR)/%.html : $(MDDIR)/%.md $(MDDIR)
	pandoc -B header -A footer $< -o $@
 
clean :
	rm -rf $(OUTDIR)/*
 
# Remove all HTMLS outputs then build them again
rebuild : clean all
