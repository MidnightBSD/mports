# $MidnightBSD: mports/sysutils/extipl/Makefile,v 1.2 2009/12/28 23:04:00 laffer1 Exp $

PORTNAME=	extipl
PORTVERSION=	5.04
CATEGORIES=	sysutils
MASTER_SITES=	SFJP/${PORTNAME}/2166

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Partition-selectable boot loader for IBM-PC/AT compatibles
LICENSE=	gpl2

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
