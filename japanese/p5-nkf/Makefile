PORTNAME=	nkf
PORTVERSION=	2.1.4
PORTEPOCH=	1
CATEGORIES=	japanese perl5
MASTER_SITES=	OSDN/${PORTNAME}
PKGNAMEPREFIX=	ja-p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension module to use NKF
WWW=		https://sourceforge.jp/projects/nkf/

LICENSE=	zlib NKF
LICENSE_COMB=	multi
LICENSE_NAME_NKF=	NKF License
LICENSE_FILE_zlib=	${WRKSRC}/NKF.pm
LICENSE_FILE_NKF=	${WRKSRC}/NKF.xs
LICENSE_PERMS_NKF=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		perl5
USE_PERL5=	configure
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/NKF.mod

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/NKF/NKF.so

.include <bsd.port.mk>
