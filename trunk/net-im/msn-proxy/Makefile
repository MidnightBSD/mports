# $MidnightBSD: mports/net-im/msn-proxy/Makefile,v 1.5 2013/03/09 23:31:08 laffer1 Exp $

PORTNAME=	msn-proxy
PORTVERSION=	0.7
PORTREVISION=	2
CATEGORIES=	net-im
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Messenger proxy/control daemon

LICENSE=	other

DEPRECATED=	Primary MSN Messenger service terminated 30 APR 2013
EXPIRATION_DATE=2013-10-31

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
