COMMENT=	CVS emulation and import/export for git

SUBPORT=	cvs

MASTERDIR=	${.CURDIR}/../git
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

#.include "${MASTERDIR}/Makefile"

SHEBANG_FILES+=	git-cvsserver.perl git-cvsexportcommit.perl git-cvsimport.perl

post-install:	
	${REINPLACE_CMD} -i "" -e 's|/usr/bin/perl|/usr/local/bin/perl|g' ${PREFIX}/bin/git-cvsserver \
		${PREFIX}/libexec/git-core/git-cvsexportcommit \
		${PREFIX}/libexec/git-core/git-cvsimport \
		${PREFIX}/libexec/git-core/git-cvsserver

.include "${MASTERDIR}/Makefile"
