# New ports collection makefile for: adodb
# Date created:		4 May 2001
# Whom:			abgoeree@uwnet.nl
#
# $MidnightBSD: mports/databases/adodb/Makefile,v 1.3 2009/10/14 00:24:13 laffer1 Exp $
# $FreeBSD: ports/databases/adodb/Makefile,v 1.46 2007/04/05 13:19:01 mm Exp $
#

PORTNAME=	adodb
PORTVERSION=	4.99.2
CATEGORIES=	databases www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-php-4-and-5/${PORTNAME}-${PORTVERSION:S/.//g}-for-php
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//g}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database library for PHP
LICENSE=	bsd4
#dual bsd4 / gpl2.. we choose the better of the two

USE_PHP=	pcre

CONFLICTS=	adodb-5.*

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	YES

ADODB_DIR?=	share/adodb
PLIST_SUB=	ADODB_DIR=${ADODB_DIR}

ADODB_SUBDIRS=	contrib datadict drivers lang pear perf session xsl

OPTIONS=	TESTS "Install tests" off

.include <bsd.port.pre.mk>

.if defined (WITH_TESTS)
PLIST_SUB+=	TESTS=
.else
PLIST_SUB+=	TESTS="@comment "
.endif

post-patch:
	@cd ${WRKSRC}; ${RM} -f cute_icons_for_site/Thumbs.db

do-install:
	@${MKDIR} ${PREFIX}/${ADODB_DIR}
	@cd ${WRKSRC}; ${FIND} ${ADODB_SUBDIRS} -type d \
		-exec ${MKDIR} ${PREFIX}/${ADODB_DIR}/{} \;
	@cd ${WRKSRC}; ${FIND} . ! -path './*/*' -type f \( -name '*.php' -or -name '*.dtd' -or -name '*.zip' \) \
		-exec ${INSTALL_DATA} ${WRKSRC}/{} ${PREFIX}/${ADODB_DIR}/{} \;
	@cd ${WRKSRC}; ${FIND} ${ADODB_SUBDIRS} -type f \
		-exec ${INSTALL_DATA} ${WRKSRC}/{} ${PREFIX}/${ADODB_DIR}/{} \;

.if defined (WITH_TESTS)
	@${MKDIR} ${PREFIX}/${ADODB_DIR}/tests
	@cd ${WRKSRC}; ${FIND} tests -type f \
		-exec ${INSTALL_DATA} ${WRKSRC}/{} ${PREFIX}/${ADODB_DIR}/{} \;
.endif

post-install:
.if !defined (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR} ${DOCSDIR}/cute_icons_for_site
	@cd ${WRKSRC}; ${FIND} . ! -path './*/*' -type f -name '*.txt' \
		-exec ${INSTALL_MAN} ${WRKSRC}/{} ${DOCSDIR}/{} \;
	@cd ${WRKSRC}/docs; ${FIND} . -type f \
		-exec ${INSTALL_MAN} ${WRKSRC}/docs/{} ${DOCSDIR}/{} \;
	@cd ${WRKSRC}; ${FIND} cute_icons_for_site -type f \
		-exec ${INSTALL_MAN} ${WRKSRC}/{} ${DOCSDIR}/{} \;
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
