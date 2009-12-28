# $MidnightBSD: mports/shells/rssh/Makefile,v 1.2 2007/05/17 18:27:27 ctriv Exp $

PORTNAME=	rssh
PORTVERSION=	2.3.2
CATEGORIES=	shells security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Restricted Secure SHell only for sftp or/and scp

GNU_CONFIGURE=	yes

MAN1=		rssh.1
MAN5=		rssh.conf.5

OPTIONS=	RDIST "rdist support" off

.include <bsd.port.pre.mk>

.if defined(WITH_RDIST)
RUN_DEPENDS+=	${LOCALBASE}/bin/rdist6:${PORTSDIR}/net/rdist6
CONFIGURE_ARGS+=--with-rdist=${LOCALBASE}/bin/rdist6
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's,(\$$\(DESTDIR\)\$$\(sysconfdir\)/\$$\$$f),\1.dist,g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
