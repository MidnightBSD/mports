# Created by: nils@guru.ims.uni-stuttgart.de
# $FreeBSD: head/devel/dmake/Makefile 363399 2014-07-29 21:43:17Z adamw $
# $MidnightBSD$

PORTNAME=	dmake
PORTVERSION=	4.12.2
CATEGORIES=	devel
MASTER_SITES=	http://dmake.apache-extras.org.codespot.com/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Another hyper make utility

LICENSE=	gpl

USES=        tar:bzip2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--datarootdir=${DATADIR}

post-install:
	${INSTALL_MAN} ${WRKSRC}/man/dmake.tf ${PREFIX}/man/man1/dmake.1

.include <bsd.port.mk>
