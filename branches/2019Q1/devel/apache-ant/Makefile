# $MidnightBSD$

PORTNAME=	apache-ant
PORTVERSION=	1.9.3
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_APACHE:S,%SUBDIR%/,ant/binaries/:bin,} \
		FREEBSD_LOCAL/hq:man
DISTFILES=	${ANT_DISTFILE}:bin \
		${MANPAGE_DISTFILE}:man
EXTRACT_ONLY=	${ANT_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java- and XML-based build tool, conceptually similar to make

LICENSE=	apache2

RUN_DEPENDS=	classpath:${PORTSDIR}/java/javavmwrapper

OPTIONS_DEFINE=	DOCS

ANT_DISTFILE=	${PORTNAME}-${PORTVERSION}-bin.tar.bz2
MANPAGE_DISTFILE=	${PORTNAME}-manpage-${MANPAGE_VERSION}.tgz
MANPAGE_VERSION=	20030908
USES=		tar:bzip2
USE_JAVA=	1.7+

NO_BUILD=	YES
DATADIR=	${JAVASHAREDIR}/${PORTNAME}

READMES=	LICENSE README WHATSNEW

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
DISTFILES+=	${PORTNAME}-${PORTVERSION}-manual.tar.bz2:doc
MASTER_SITES+=	${MASTER_SITE_APACHE:S,%SUBDIR%/,ant/manual/:doc,}
PORTDOCS=	*
.endif

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

MANPAGE_SUBDIR=	apache-ant-manpage
MANPAGE_WRKSRC=	${WRKSRC}/${MANPAGE_SUBDIR}

SUB_FILES=	ant.sh

post-extract:
	@${TAR} -C ${WRKSRC} -xzf ${DISTDIR}/${MANPAGE_DISTFILE}

do-install:
	@${ECHO_MSG} -n ">> Installing scripts..."
	@${MKDIR} ${DATADIR}/bin
	@${INSTALL_SCRIPT} ${WRKDIR}/ant.sh ${PREFIX}/bin/ant
	@${INSTALL_SCRIPT} ${WRKSRC}/bin/antRun ${DATADIR}/bin/
	@${ECHO_MSG} " [ DONE ]"

.for d in etc lib
	@${ECHO_MSG} -n ">> Installing data directory '${d}'..."
	@cd ${WRKSRC} && ${COPYTREE_SHARE} ${d} ${DATADIR}/
	@${ECHO_MSG} " [ DONE ]"
.endfor

	@${ECHO_MSG} -n ">> Installing manpages..."
	@${INSTALL_MAN} ${MANPAGE_WRKSRC}/ant.1 ${MAN1PREFIX}/man/man1
	@${INSTALL_MAN} ${MANPAGE_WRKSRC}/build.xml.5 ${MAN5PREFIX}/man/man5
	@${ECHO_MSG} " [ DONE ]"

.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}

	@${ECHO_MSG} -n ">> Installing readme files..."
	@${INSTALL_DATA} ${READMES:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} " [ DONE ]"

	@${ECHO_MSG} -n ">> Installing documentation files..."
	@cd ${WRKSRC} && ${COPYTREE_SHARE} manual ${DOCSDIR}/
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
