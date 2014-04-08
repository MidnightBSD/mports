# New ports collection makefile for:    ldapdiff
# Date created:         15 February 2002
# Whom:                 Christian Brueffer <chris@unixpages.org)
#
# $MidnightBSD$
# $FreeBSD: ports/net/ldapdiff/Makefile,v 1.16 2007/05/26 12:57:53 rafan Exp $
#

PORTNAME=	ldapdiff
PORTVERSION=	1.4.1
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	http://launchpadlibrarian.net/20391352/
DISTNAME=	${PORTNAME}-${PORTVERSION}_src
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility for patching LDAP directories using LDIF files
LICENSE=	gpl2

USES=		iconv
USE_OPENLDAP=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${LOCALBASE} \
		--with-ldap-dir=${LOCALBASE}
SAMPLES=	addentry.sh webtomware_without_jpeg.user.ldif \
		webtomware.init.ldif webtomware.user.ldif

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTDOCS=	CHANGES ChangeLog README TODO


.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=--with-iconv-dir=${LOCALBASE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ldapdiff ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/ldapdiff.1 ${MAN1PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/ldapdiff.conf.sample ${PREFIX}/etc/
	@${MKDIR} ${DATADIR}/samples
.for sample in ${SAMPLES}
	${INSTALL_DATA} ${WRKSRC}/samples/${sample} ${DATADIR}/samples
.endfor
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for docs in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
