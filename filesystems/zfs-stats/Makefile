PORTNAME=	zfs-stats
PORTVERSION=	1.3.0
CATEGORIES=	sysutils
MASTER_SITES=	GH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display human-readable ZFS statistics

LICENSE=	bsd2

USES=		perl5
USE_GITHUB=	yes
GH_ACCOUNT=	mmatuska

NO_BUILD=	yes

PLIST_FILES=	bin/zfs-stats \
		bin/zfs-mon

post-patch:
	@${REINPLACE_CMD} -e "s|/usr/bin/env -iS perl|${PERL}|g" ${WRKSRC}/zfs-stats

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-stats ${PREFIX}/bin/zfs-stats
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-mon ${PREFIX}/bin/zfs-mon

.include <bsd.port.mk>
