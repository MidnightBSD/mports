# $MidnightBSD: mports/devel/mm/Makefile,v 1.1 2008/08/17 22:37:11 laffer1 Exp $

PORTNAME=	mm
PORTVERSION=	1.4.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OSSP}
MASTER_SITE_SUBDIR=	lib/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory allocation library for pre-forked process models
LICENSE=	bsd4

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.1

MAN1=		mm-config.1
MAN3=		mm.3

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

test:
	@cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
