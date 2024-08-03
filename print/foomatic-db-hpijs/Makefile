PORTNAME=	foomatic-db-hpijs
PORTVERSION=	1.4
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=lofi
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foomatic data for the HPIJS printer drivers
WWW=		https://www.linuxprinting.org

LICENSE=	gpl2+

BUILD_DEPENDS=	${LOCALBASE}/share/foomatic/db/oldprinterids:print/foomatic-db
RUN_DEPENDS=	${LOCALBASE}/share/foomatic/db/oldprinterids:print/foomatic-db

GNU_CONFIGURE=	yes
USES=		gmake perl5
USE_PERL5=	build

post-patch:
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' \
			 -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/configure

.include <bsd.port.mk>
