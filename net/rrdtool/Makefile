# New ports collection makefile for:	rrdtool
# Date created:				20 July 1999
# Whom:					Dmitry Sivachenko <dima@Chg.RU>
#
# $FreeBSD: ports/net/rrdtool/Makefile,v 1.59 2006/08/16 08:38:14 demon Exp $
# $MidnightBSD: mports/net/rrdtool/Makefile,v 1.2 2007/05/21 20:49:32 ctriv Exp $
#

PORTNAME=	rrdtool
PORTVERSION=	1.2.15
CATEGORIES=	net
MASTER_SITES=	http://oss.oetiker.ch/rrdtool/pub/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Round Robin Database Tools
LICENSE=	gpl2

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		art_lgpl_2.5:${PORTSDIR}/graphics/libart_lgpl \
		png.5:${PORTSDIR}/graphics/png

USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-perl-site-install --disable-python --disable-tcl
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/libart-2.0 -I${LOCALBASE}/include/freetype2
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS:=	${CFLAGS:N-ffast-math}
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_LDCONFIG=	yes

MAN1=		bin_dec_hex.1 cdeftutorial.1 rpntutorial.1 rrd-beginners.1 \
		rrdbuild.1 rrdcgi.1 rrdcreate.1 rrddump.1 rrdfetch.1 rrdfirst.1 \
		rrdgraph.1 rrdgraph_data.1 rrdgraph_examples.1 rrdgraph_graph.1 \
		rrdgraph_rpn.1 rrdinfo.1 rrdlast.1 rrdresize.1 rrdrestore.1 \
		rrdthreads.1 rrdtool.1 rrdtune.1 rrdtutorial.1 rrdupdate.1 \
		rrdxport.1
MAN3=		RRDp.3 RRDs.3
MAN3PREFIX=	${TARGETDIR}/lib/perl5/${PERL_VERSION}

post-extract:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's/install-idocDATA install-ihtmlDATA//g' \
		${WRKSRC}/doc/Makefile.in
.endif

done-message: example-message

example-message:
.if !defined(BATCH)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "############################################################################"
	@${ECHO_MSG} "# See ${PREFIX}/share/examples/rrdtool for some demonstration code        #"
	@${ECHO_MSG} "############################################################################"
.endif

.include <bsd.port.mk>
