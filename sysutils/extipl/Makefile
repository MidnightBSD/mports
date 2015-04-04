# $MidnightBSD$

PORTNAME=	extipl
PORTVERSION=	5.04
CATEGORIES=	sysutils
MASTER_SITES=	SFJP/${PORTNAME}/2166

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Partition-selectable boot loader for IBM-PC/AT compatibles
LICENSE=	gpl2

BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm

WRKSRC=		${WRKDIR}/${DISTNAME}/src

post-patch:
	cd ${WRKSRC}; \
	${REINPLACE_CMD} -e 's/^(CC)\t=/$$1?=/;' \
		-e 's/(DIR)[\t]*[?]=/$$1=/;' Makefile

.include <bsd.port.mk>
