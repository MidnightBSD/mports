# $MidnightBSD: mports/benchmarks/netperf/Makefile,v 1.4 2010/11/13 16:30:32 laffer1 Exp $

PORTNAME=	netperf
PORTVERSION=	2.6.0
CATEGORIES=	benchmarks ipv6
MASTER_SITES=	ftp://ftp.netperf.org/netperf/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	network performance benchmarking package
LICENSE=	other

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	"transform="
CONFIGURE_ARGS=	--program-prefix=""  --program-suffix=""
MAN1=		netperf.1 netserver.1

INFO=		netperf
SCRIPTS=	arr_script packet_byte_script sctp_stream_script snapshot_script \
		tcp_range_script tcp_rr_script tcp_stream_script udp_rr_script \
		udp_stream_script

post-patch:
.for i in ${SCRIPTS}
	@${REINPLACE_CMD} -e 's^%%PREFIX%%^${PREFIX}^' ${WRKSRC}/doc/examples/$i
.endfor

post-install:
	${MKDIR} ${EXAMPLESDIR}
.for i in ${SCRIPTS}
	${INSTALL_SCRIPT} ${WRKSRC}/doc/examples/$i ${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
