PORTNAME=	libmng
PORTVERSION=	1.0.10
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-devel/${PORTVERSION} \
		http://www.libmng.com/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiple-image Network Graphics (MNG) reference library

LICENSE=	bsd3

LIB_DEPENDS=	liblcms.so:${PORTSDIR}/graphics/lcms

OPTIONS_DEFINE=	MNG_OPTIMIZE
MNG_OPTIMIZE_DESC=	Use vendor's new optimization flags

MAKEFILE=	${FILESDIR}/Makefile.bsd

USES=		jpeg uidfix
USE_LDCONFIG=	yes

MNG_OPTIMIZE_MAKE_ARGS=	WITH_MNG_OPTIMIZE=true
MNG_OPTIMIZE_MAKE_ARGS_OFF=	WITH_MNG_OPTIMIZE=off

post-install:
	cd ${WRKSRC}/doc/man && ${INSTALL_MAN} libmng.3 ${PREFIX}/man/man3 \
		&& ${INSTALL_MAN} mng.5 jng.5 ${PREFIX}/man/man5

.include <bsd.port.mk>
