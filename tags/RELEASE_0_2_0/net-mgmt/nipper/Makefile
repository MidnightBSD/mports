# New ports collection makefile for:	nipper
# Date created:		3 May 2007
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/net-mgmt/nipper/Makefile,v 1.1 2008/02/28 14:25:11 laffer1 Exp $
# $FreeBSD: ports/net-mgmt/nipper/Makefile,v 1.16 2008/02/27 20:37:48 sat Exp $
#

PORTNAME=	nipper
PORTVERSION=	0.11.7
CATEGORIES=	net-mgmt
MASTER_SITES=	SF
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netdev config analyzer
LICENSE=        gpl3
PLIST_FILES=	bin/${PORTNAME} etc/nipper.conf.sample
PORTDOCS=	Changelog Readme TODO Features.txt Options.txt Quickstart.txt \
		XML.txt
MAN1=	${PORTNAME}.1
MAN5=	${PORTNAME}.conf.5

post-extract:
	@${MV} ${WRKSRC}/docs/* ${WRKSRC}/

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/|${PREFIX}/etc/|'\
		${WRKSRC}/common/* ${WRKSRC}/man/*

do-build:
	@cd ${WRKSRC}/ && ${CC} ${CFLAGS} -o ${PORTNAME} ${PORTNAME}.c

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL_DATA} ${WRKSRC}/nipper.conf ${PREFIX}/etc/nipper.conf.sample
	@${INSTALL_MAN} ${WRKSRC}/man/nipper.1 ${MAN1PREFIX}/man/man1/
	@${INSTALL_MAN} ${WRKSRC}/man/nipper.conf.5 ${MAN5PREFIX}/man/man5/
.ifndef NOPORTDOCS
	@${INSTALL} -d ${DOCSDIR}/
	@cd ${WRKSRC}/&&${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
