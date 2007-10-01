# New ports collection makefile for:	extipl
# Date created:		8 January 2001
# Whom:			KIMURA Takamichi <takamiti@tsden.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/extipl/Makefile,v 1.8 2007/03/14 08:24:47 linimon Exp $
#

PORTNAME=	extipl
PORTVERSION=	5.04
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ports.jp.FreeBSD.org/pub/FreeBSD-jp/ports-jp/LOCAL_PORTS/ \
		http://www.tsden.org/takamiti/extipl/archs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Partition-selectable boot loader for IBM-PC/AT compatibles

BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm

ONLY_FOR_ARCHS=	i386 amd64

WRKSRC=		${WRKDIR}/${DISTNAME}/src

MAN8=		extipl.8
MANCOMPRESSED=	yes

post-patch:
	cd ${WRKSRC}; \
	${REINPLACE_CMD} -e 's/^(CC)\t=/$$1?=/;' \
		-e 's/(DIR)[\t]*[?]=/$$1=/;' Makefile

.include <bsd.port.mk>
