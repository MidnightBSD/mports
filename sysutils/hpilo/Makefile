PORTNAME=	hpilo
PORTVERSION=	1.5.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HPE iLO management driver
WWW=		https://github.com/djzort/hpilo

LICENSE=	gpl2 mit
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		kmod
ONLY_FOR_ARCHS=	amd64 i386
USE_GITHUB=	yes
GH_ACCOUNT=	djzort
GH_TAGNAME=	67fabc0807dec53c600bf11f0bd4019c10e64e80

PLIST_FILES=	${KMODDIR}/hpilo.ko

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 402000 || ${OSVERSION} >= 403000
IGNORE=		only supports MidnightBSD 4.2 (FreeBSD 13.5 base)
.endif

do-install:
	${INSTALL_KLD} ${WRKSRC}/hpilo.ko ${KMODDIR}

.include <bsd.port.post.mk>
