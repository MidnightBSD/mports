# $MidnightBSD$

PORTNAME=	rssh
PORTVERSION=	2.3.2
CATEGORIES=	shells security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Restricted Secure SHell only for sftp or/and scp

LICENSE=	other
# slightly modified bsd license

GNU_CONFIGURE=	yes

OPTIONS=	RDIST "rdist support" off

.include <bsd.port.pre.mk>

.if defined(WITH_RDIST)
RUN_DEPENDS+=	${LOCALBASE}/bin/rdist6:${PORTSDIR}/net/rdist6
CONFIGURE_ARGS+=--with-rdist=${LOCALBASE}/bin/rdist6
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's,(\$$\(DESTDIR\)\$$\(sysconfdir\)/\$$\$$f),\1.dist,g' \
		${WRKSRC}/Makefile.in

post-install:
	${MV} ${PREFIX}/etc/rssh.conf.dist.dist ${PREFIX}/etc/rssh.conf.dist

.include <bsd.port.post.mk>
