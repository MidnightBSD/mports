# $MidnightBSD: mports/graphics/libmng/Makefile,v 1.7 2010/04/25 12:29:12 laffer1 Exp $

PORTNAME=	libmng
PORTVERSION=	1.0.10
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-devel/${PORTVERSION} \
		http://www.libmng.com/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiple-image Network Graphics (MNG) reference library
LICENSE=	bsd3

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		lcms:${PORTSDIR}/graphics/lcms

OPTIONS=	MNG_OPTIMIZE "Use vendor's new optimization flags" off

MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ARGS+=	WITH_MNG_OPTIMIZE=${WITH_MNG_OPTIMIZE}
MAKE_JOBS_SAFE=	yes

USE_LDCONFIG=	yes

MAN3=		libmng.3
MAN5=		mng.5 jng.5

post-install:
	cd ${WRKSRC}/doc/man && ${INSTALL_MAN} ${MAN3} ${PREFIX}/man/man3 \
		&& ${INSTALL_MAN} ${MAN5} ${PREFIX}/man/man5

.include <bsd.port.mk>
