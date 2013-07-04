# $MidnightBSD: mports/net-im/msn-proxy/Makefile,v 1.4 2011/01/12 14:05:56 laffer1 Exp $
# $FreeBSD: ports/net-im/msn-proxy/Makefile,v 1.1 2008/01/21 19:11:20 miwi Exp $

PORTNAME=	msn-proxy
PORTVERSION=	0.7
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Messenger proxy/control daemon
LICENSE=	other
#almost mit/bsd ish in nature.

LIB_DEPENDS=	event-1.4:${PORTSDIR}/devel/libevent

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

DOCS=		INSTALL
MSNPROXYWWW=	js.inc.php lists.inc.php chat-to.php chat.php conf.php \
		default.array.cmd.inc.php default.array.option.inc.php \
		default.array.status.inc.php fl.inc.php group.inc.php \
		header.inc.php index.php save_contact_op.php save_default_op.php \
		save_msg.php save_user_op.php user.php view-to.php view.php \
		user.inc.php mysql.inc.php class.ctl.php .htaccess
MSNPROXYIMG=	ausente.gif block.gif notinlist.png ocupado.gif offline.gif \
		online.gif send_im.gif webcam.png

SUB_FILES=	pkg-message-mysql
WANT_PHP_WEB=	yes
USE_PHP=	mysql session sockets
USE_MYSQL=	yes
MAKE_ARGS=	SYSCONFDIR=$(FAKE_DESTDIR)${PREFIX}/etc/msn-proxy \
		BINDIR=$(FAKE_DESTDIR)${PREFIX}/bin

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/config.h

post-install:
	@${MKDIR} ${WWWDIR}
.for FILE in ${MSNPROXYWWW}
	@cd ${WRKSRC}/php && ${INSTALL} -m 644 ${FILE} ${WWWDIR}
.endfor
	@${MKDIR} ${WWWDIR}/imagens
.for FILE in ${MSNPROXYIMG}
	@cd ${WRKSRC}/php/imagens && ${INSTALL} -m 644 ${FILE} ${WWWDIR}/imagens
.endfor
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}/${FILE}
.endfor
.endif

.include <bsd.port.post.mk>
