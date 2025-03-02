PORTNAME=	apache-ant
DISTVERSION=	1.10.13
PORTREVISION=	1
CATEGORIES=	devel java
MASTER_SITES=	APACHE/ant/binaries:bin \
		https://deb.debian.org/debian/pool/main/a/ant/:man
DISTFILES=	${ANT_DISTFILE}:bin \
		${MANPAGE_DISTFILE}:man
EXTRACT_ONLY=	${ANT_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java- and XML-based build tool, conceptually similar to make
WWW=		https://ant.apache.org/

LICENSE=	apache2

USES=		cpe java tar:bzip2
CPE_VENDOR=	apache
CPE_PRODUCT=	ant

ANT_DISTFILE=	${PORTNAME}-${DISTVERSION}-bin.tar.bz2
MANPAGE_DISTFILE=	ant_${DISTVERSION}-${MANPAGE_VERSION}.debian.tar.xz
MANPAGE_VERSION=	1

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
NO_ARCH=	yes
NO_BUILD=	yes

READMES=	LICENSE README WHATSNEW

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
DISTFILES+=	${PORTNAME}-${DISTVERSION}-manual.tar.bz2:doc
MASTER_SITES+=	APACHE/ant/manual:doc
PORTDOCS=	*
.endif

SUB_FILES=	ant.sh

post-extract:
	@${TAR} -C ${WRKSRC} -xJf ${DISTDIR}/${MANPAGE_DISTFILE} debian/ant.1 debian/build.xml.5

do-install:
	@${ECHO_MSG} -n ">> Installing scripts..."
	@${MKDIR} ${DATADIR}/bin
	@${INSTALL_SCRIPT} ${WRKDIR}/ant.sh ${PREFIX}/bin/ant
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/antRun ${DATADIR}/bin/
	@${ECHO_MSG} " [ DONE ]"

.for d in etc lib
	@${ECHO_MSG} -n ">> Installing data directory '${d}'..."
	cd ${WRKSRC} && ${COPYTREE_SHARE} ${d} ${STAGEDIR}${DATADIR}/
	@${ECHO_MSG} " [ DONE ]"
.endfor

	@${ECHO_MSG} -n ">> Installing manpages..."
	${INSTALL_MAN} ${WRKSRC}/debian/ant.1 ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/debian/build.xml.5 ${PREFIX}/share/man/man5
	@${ECHO_MSG} " [ DONE ]"

.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}

	@${ECHO_MSG} -n ">> Installing readme files..."
	${INSTALL_DATA} ${READMES:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} " [ DONE ]"

	@${ECHO_MSG} -n ">> Installing documentation files..."
	cd ${WRKSRC} && ${COPYTREE_SHARE} manual ${DOCSDIR}/
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
