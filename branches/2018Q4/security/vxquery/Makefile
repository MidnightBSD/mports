# Created by: nectar@FreeBSD.org
# $FreeBSD: head/security/vxquery/Makefile 363399 2014-07-29 21:43:17Z adamw $
# $MidnightBSD$

PORTNAME=	vxquery
PORTVERSION=	0.2.1
CATEGORIES=	security textproc
MASTER_SITES=	http://www.vuxml.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VuXML Query Tool

LICENSE=	bsd2

USES=	tar:bzip2
GNU_CONFIGURE=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/object/vxquery ${PREFIX}/bin
	${INSTALL_SCRIPT} ${FILESDIR}/pkg_check.sh ${PREFIX}/bin

.include <bsd.port.mk>
