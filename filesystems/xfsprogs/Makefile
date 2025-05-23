PORTNAME=	xfsprogs
PORTVERSION=	3.2.4
CATEGORIES=	filesystems sysutils
MASTER_SITES=	ftp://oss.sgi.com/projects/xfs/cmd_tars/ \
		ftp://oss.sgi.com/projects/xfs/previous/cmd_tars/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for managing XFS filesystems
WWW=		http://oss.sgi.com/projects/xfs/

LICENSE=	lgpl2.1 gpl2
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/doc/COPYING

CPE_PRODUCT=	${PORTNAME}
CPE_VENDOR=	sgi
USES=		cpe gettext gmake libtool:build readline localbase
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	OPTIMIZER=-fcommon
CONFIGURE_ARGS=	--disable-shared --enable-readline
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
CFLAGS+=	-L/usr/local/lib -I/usr/local/include -lgettextlib -lintl
LDFLAGS+=	-L/usr/local/lib -lgettextlib -lintl
ALL_TARGET=	# empty
MAKE_ARGS=	V=1

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/utmp/d' \
		${WRKSRC}/quota/report.c ${WRKSRC}/quota/util.c
	@${REINPLACE_CMD} \
		-e 's|/usr/local|${LOCALBASE}|g' \
		-e 's/lio_listio/timer_create/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/#!/s|bash|sh|' \
		${WRKSRC}/include/install-sh ${WRKSRC}/install-sh
	${LN} ${WRKSRC}/libxfs/freebsd.c ${WRKSRC}/libxfs/midnightbsd.c
	${LN} ${WRKSRC}/quota/freebsd.c ${WRKSRC}/quota/midnightbsd.c

post-install:
.for f in mkfs.xfs xfs_copy xfs_db xfs_estimate xfs_fsr xfs_growfs xfs_io \
     xfs_logprint xfs_mdrestore xfs_quota xfs_repair xfs_rtcp
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/sbin/${f}
.endfor

.include <bsd.port.mk>
