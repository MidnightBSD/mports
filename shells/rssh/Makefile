# $MidnightBSD: mports/shells/rssh/Makefile,v 1.3 2009/12/28 20:37:06 laffer1 Exp $

PORTNAME=	rssh
PORTVERSION=	2.3.2
CATEGORIES=	shells security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Restricted Secure SHell only for sftp or/and scp
LICENSE=	other
# slightly modified bsd license

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
