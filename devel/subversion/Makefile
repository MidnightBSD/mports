# New ports collection makefile for:	subversion
# Date created:				10 September 2001
# Whom:					rooneg@electricjellyfish.net
#
# $MidnightBSD: mports/devel/subversion/Makefile,v 1.14 2008/10/29 18:46:50 ctriv Exp $
# $FreeBSD: ports/devel/subversion/Makefile,v 1.106 2006/09/13 10:20:27 lev Exp $

PORTNAME=	subversion
PORTVERSION=	1.4.6
CATEGORIES=	devel
MASTER_SITES=	http://subversion.tigris.org/downloads/:main \
		http://svnbook.red-bean.com/en/1.2/:bookhtml \
		http://svnbook.red-bean.com/en/1.2/images/:bookhtmlimg \
		http://svnbook.red-bean.com/en/1.2/:bookpdf
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}:main
DIST_SUBDIR=	subversion
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version control system
LICENSE=	other
# for the most part it's similar to a traditional BSD 4 clause license.

CONFLICTS=	subversion-perl-[0-9]* subversion-python-[0-9]* subversion-ruby-[0-9]*

OPTIONS=	NEON "Enable WebDAV/Delta-V repository access" On \
		BDB  "Enable db4 repository backend" On \
		MAINTAINER_DEBUG "Build debug version" Off \
		PERL "Build perl bindings" Off \
		PYTHON "Build python bindings" Off \
		RUBY "Build ruby bindings" Off \
		JAVA "Build java (JavaHL) bindings" Off \
		MOD_DAV_SVN "Enable Apache 2.x module" Off \
		APACHE2_APR "Don't use bundled APR" Off \
		SVNSERVE_WRAPPER "Enable svnserve wrapper" Off \
		REPOSITORY_CREATION "Make a repository" Off \
		BOOK "Install the subversion book" Off \
		ASVN "Install asvn" Off 

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

USE_LDCONFIG=	yes

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=		--with-ssl

USE_RC_SUBR=	svnserve

MAN1=		svn.1 svnadmin.1 svnlook.1 svndumpfilter.1 svnsync.1 svnversion.1
MAN5=		svnserve.conf.5
MAN8=		svnserve.8
MANCOMPRESSED=	no

PKGINSTALL=	${WRKDIR}/pkg-install

TXT_DOCS=	BUGS CHANGES COMMITTERS COPYING HACKING INSTALL README
.if !defined(NOPORTDOCS)
PORTDOCS=	${TXT_DOCS}
.endif

.include <bsd.mport.options.mk>


.if defined(WITH_ASVN)
RUN_DEPENDS= ${LOCALBASE}/bin/gfind:${PORTSDIR}/misc/findutils:install
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
PLIST_SUB+=		WITHOUT_GETTEXT=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		WITHOUT_GETTEXT="@comment "
.endif

.if defined(WITH_PERL)
SWIG_BINDINGS+=		yes
USE_PERL5=		yes
PLIST_SUB+=		WITH_PERL=""
MAN3PREFIX=		${TARGETDIR}/lib/perl5/${PERL_VERSION}
MAN3=			SVN::Base.3 \
			SVN::Client.3 \
			SVN::Core.3 \
			SVN::Delta.3 \
			SVN::Fs.3 \
			SVN::Ra.3 \
			SVN::Repos.3 \
			SVN::Wc.3
.else
PLIST_SUB+=		WITH_PERL="@comment "
.endif

.if defined(WITH_PYTHON)
USE_PYTHON=		yes
SWIG_BINDINGS+=		yes
PLIST_SUB+=		WITH_PYTHON=""
.else
PLIST_SUB+=		WITH_PYTHON="@comment "
.endif

.if defined(WITH_RUBY)
USE_RUBY=		yes
SWIG_BINDINGS+=		yes
PLIST_SUB+=		WITH_RUBY=""
.else
PLIST_SUB+=		WITH_RUBY="@comment "
.endif

.if defined(WITH_JAVA)
CATEGORIES+=	java
USE_JAVA=	yes
JAVA_VERSION=	1.2+
JAVA_OS=	native
JAVA_BUILD=	yes
JAVA_RUN=	yes
CONFIGURE_ARGS+=	--enable-javahl --with-jdk=${JAVA_HOME}
PLIST_SUB+=		WITH_JAVA=""
.else
PLIST_SUB+=		WITH_JAVA="@comment "
.endif


.if defined(WITH_APACHE2_APR)
USE_APACHE=	2.0+
.if ${APACHE_VERSION} >= 22
APR_APU_DIR=	${LOCALBASE}/bin
APR_CONFIG=	apr-1-config
APU_CONFIG=	apu-1-config
.else
APR_APU_DIR=	${LOCALBASE}/lib/apache2
APR_CONFIG=	apr-config
APU_CONFIG=	apu-config
.endif
APR_PORT=	${APACHE_PORT}
.if !defined(WITHOUT_BDB)
DEPENDS_ARGS+=	WITH_BERKELEYDB=db4
OPT_NAME=	WITH_BERKELEYDB=(db4|db41|db42)
.endif
.else
APR_APU_DIR=	${LOCALBASE}/bin
APR_CONFIG=	apr-1-config
APU_CONFIG=	apu-1-config
.if !defined(WITHOUT_BDB)
LIB_DEPENDS+=	apr-1.2:${PORTSDIR}/devel/apr-svn
APR_PORT=	devel/apr-svn
OPT_NAME=	APR_UTIL_WITH_BERKELEY_DB=yes
.else
LIB_DEPENDS+=	apr-1.2:${PORTSDIR}/devel/apr
APR_PORT=	devel/apr
.endif
.endif


.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fpic -DPIC
.endif

SVNREPOS?=	/home/svn/repos
SVNFSTYPE?=	fsfs


.if defined(WITH_MAINTAINER_DEBUG)
CONFIGURE_ARGS+=--enable-maintainer-mode \
		--enable-debug
CFLAGS+=	-g
.endif

.if defined(WITH_REPOSITORY_CREATION) 
SUB_FILES+=	install-repos
SUB_LIST+= 	WITH_SVNSERVE_WRAPPER=${WITH_SVNSERVE_WRAPPER} \
		SVNREPOS=${SVNREPOS} \
		SVNFSTYPE=${SVNFSTYPE}
.endif

.if !defined(WITHOUT_NEON)
LIB_DEPENDS+=	neon.26:${PORTSDIR}/www/neon26
CONFIGURE_ARGS+=	--with-neon=${LOCALBASE}
PLIST_SUB+=		WITHOUT_NEON=""
.else
CONFIGURE_ARGS+=	--without-neon
PLIST_SUB+=		WITHOUT_NEON="@comment "
.endif

.if defined(WITHOUT_BDB)
CONFIGURE_ARGS+=	--without-berkeley-db
PLIST_SUB+=		WITHOUT_BDB="@comment "
.else
PLIST_SUB+=		WITHOUT_BDB=""
.endif

.if !defined(SWIG_BINDINGS)
CONFIGURE_ARGS+=	--without-swig --disable-swig-bindings
.endif

.if defined(WITH_MOD_DAV_SVN)
WITH_APACHE2_APR=	yes
CONFIGURE_ARGS+=	--with-apxs=${APXS}
PLIST_SUB+=	MOD_DAV_SVN=""
SVNGROUP?=	www
SUB_FILES+=	install-mod_dev_svn
SUB_LIST+=	APACHEMODDIR=${APACHEMODDIR}
.else
PLIST_SUB+=	MOD_DAV_SVN="@comment "
PKGDEINSTALL=	NONEXISTENT
SVNGROUP?=	svn
.endif

CONFIGURE_ARGS+=--with-apr=${APR_APU_DIR}/${APR_CONFIG} \
		--with-apr-util=${APR_APU_DIR}/${APU_CONFIG}

.if defined(WITH_SVNSERVE_WRAPPER)
PLIST_SUB+=	SVNSERVE_WRAPPER=""
EXTRA_PATCHES=	${PATCHDIR}/build-outputs.mk.patch
.else
PLIST_SUB+=	SVNSERVE_WRAPPER="@comment "
.endif

.if !defined(NOPORTDOCS) && defined(WITH_BOOK)
PORTDOCS+=	book
DISTFILES+=	svn-book.html:bookhtml \
		ch01dia1.png:bookhtmlimg ch02dia1.png:bookhtmlimg \
		ch02dia2.png:bookhtmlimg ch02dia3.png:bookhtmlimg \
		ch02dia5.png:bookhtmlimg ch02dia6.png:bookhtmlimg \
		ch02dia7.png:bookhtmlimg ch04dia1.png:bookhtmlimg \
		ch04dia2.png:bookhtmlimg ch04dia3.png:bookhtmlimg \
		ch04dia4.png:bookhtmlimg ch08dia1.png:bookhtmlimg \
		ch08dia2.png:bookhtmlimg \
		svn-book.pdf:bookpdf
.endif

.if defined(WITH_ASVN)
PLIST_SUB+=	ASVN=""
.else
PLIST_SUB+=	ASVN="@comment "
.endif

SCRIPTS=

SCRIPTS_DATA=

pre-everything::
.if defined(WITH_REPOSITORY_CREATION)
	@${ECHO_MSG} "I will create (or use, if it exists) \"${SVNGROUP}\" group."
	@${ECHO_MSG} "Make sure that all committers are its members."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Repository will be created at '${SVNREPOS}' with group '${SVNGROUP}'."
	@${ECHO_MSG} "Type of repository will be '${SVNFSTYPE}'."
	@${ECHO_MSG} "You could change these settings by defining SVNREPOS, SVNGROUP and SVNFSTYPE."
.endif
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Many useful scripts will be installed into ${PREFIX}/share/subversion"

#post-extract:
#	@${RM} -r ${WRKSRC}/neon
#	@${RM} -r ${WRKSRC}/apr
#	@${RM} -r ${WRKSRC}/apr-util

post-patch:
.if ${PREFIX} != "/usr"
	@${REINPLACE_CMD} "s#/etc/subversion#${PREFIX}/etc/subversion#g" ${WRKSRC}/subversion/libsvn_subr/config_file.c
	@${REINPLACE_CMD} "s#/etc/subversion#${PREFIX}/etc/subversion#g" ${WRKSRC}/subversion/libsvn_subr/config_impl.h
.endif
	@${REINPLACE_CMD} "s#^swig_pydir =.*#swig_pydir = ${PYTHON_SITELIBDIR}/libsvn#" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} "s#^swig_pydir_extra =.*#swig_pydir_extra = ${PYTHON_SITELIBDIR}/svn#" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} "s#^LIBTOOL =.*#LIBTOOL = ${LIBTOOL}#" ${WRKSRC}/Makefile.in

pre-configure:
	@if [ ! -x ${APR_APU_DIR}/${APR_CONFIG} -o ! -x ${APR_APU_DIR}/${APU_CONFIG} ] ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} 'You selected to use`'"${APR_PORT}' for apr library." ; \
		${ECHO_MSG} 'It seems that `'"${APR_PORT}' is not properly installed." ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi
.if defined(WITH_BDB)
	@if [ `${APR_APU_DIR}/${APU_CONFIG} --db-version` != "4" ] ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} 'You should build `'"${APR_PORT}' with db4 support to use subversion with it." ; \
		${ECHO_MSG} 'Please rebuild `'"${APR_PORT}' with option "'`'"${OPT_NAME}' and try again." ; \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} "Or you can disable db4 support. Only 'fs' repository backend will be available." ; \
		${ECHO_MSG} "To disable db4 support, define WITHOUT_BDB." ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi
.endif

post-build:
.if defined(WITH_PERL)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-pl
.endif
.if defined(WITH_PYTHON)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-py
.endif
.if defined(WITH_RUBY)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-rb
.endif
.if defined(WITH_JAVA)
	@${MKDIR} ${WRKSRC}/subversion/bindings/java/javahl/classes
	cd ${WRKSRC} ; \
	  ${MAKE} javahl
.endif


post-install:
	@${MKDIR} ${PREFIX}/share/subversion
	cd ${WRKSRC}/tools ; \
	  tar --exclude '*.in' -cf - * | tar -C ${PREFIX}/share/subversion -xf -
	@${CHMOD} -R a-st,o+rX ${PREFIX}/share/subversion
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${TXT_DOCS}; do \
	  ${INSTALL_DATA} ${WRKSRC}/$$f ${DOCSDIR}; \
	done
.if defined(WITH_BOOK)
	${MKDIR} ${DOCSDIR}/book
	${MKDIR} ${DOCSDIR}/book/images
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/svn-book.html ${DOCSDIR}/book
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/*.png         ${DOCSDIR}/book/images
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/svn-book.pdf  ${DOCSDIR}/book
.endif
.endif
.if defined(WITH_ASVN)
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/client-side/asvn ${PREFIX}/bin
.endif
.if defined(WITH_PERL)
	cd ${WRKSRC} ; \
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile ; \
	  ${SET_ENV} ${FAKE_SETUP} ${MAKE} install-swig-pl ${FAKE_MAKEARGS}
.endif
.if defined(WITH_PYTHON)
	cd ${WRKSRC} ; \
	  ${SET_ENV} ${FAKE_SETUP} ${MAKE} install-swig-py ${FAKE_MAKEARGS}
.endif
.if defined(WITH_RUBY)
	cd ${WRKSRC} ; \
	  ${SET_ENV} ${FAKE_SETUP} ${MAKE} install-swig-rb ${FAKE_MAKEARGS}
.endif
.if defined(WITH_JAVA)
	cd ${WRKSRC} ; \
	  ${SET_ENV} ${FAKE_SETUP} ${MAKE} install-javahl ${FAKE_MAKEARGS}
.endif
.if defined(WITH_SVNSERVE_WRAPPER)
	@${INSTALL_SCRIPT} ${FILESDIR}/svnserve.wrapper ${PREFIX}/bin/svnserve
.endif


post-fake:
	@${CAT} ${FILESDIR}/pkg-install-preamble > ${PKGINSTALL}.tmp
.if defined(WITH_MOD_DAV_SVN) 
	@${CAT} ${WRKDIR}/install-mod_dev_svn >> ${PKGINSTALL}.tmp
.endif
.if defined(WITH_REPOSITORY_CREATION) 
	@${CAT} ${WRKDIR}/install-repos >> ${PKGINSTALL}.tmp
.endif
	@if /usr/bin/cmp -s ${PKGINSTALL}.tmp ${FILESDIR}/pkg-install-preamble; then \
		rm ${PKGINSTALL}.tmp; \
	else \
		mv ${PKGINSTALL}.tmp ${PKGINSTALL}; \
	fi
			
	

.include <bsd.port.post.mk>
