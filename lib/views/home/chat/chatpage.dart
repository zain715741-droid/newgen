import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:newgen/controllers/chat_ctrl.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String uid;

  ChatPage({super.key, required this.name, required this.uid, });

  final TextEditingController msgCtrl = TextEditingController();
  final showEmoji = false.obs;
  late final ChatCtrl ctrl = Get.put( ChatCtrl(uid), tag: uid, );


  void send() {
    if (msgCtrl.text.trim().isEmpty) return;
    ctrl.sendMessage(msgCtrl.text);
    msgCtrl.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      resizeToAvoidBottomInset: true,

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff667EEA),
        foregroundColor: Colors.white,
        elevation: 0,

        title: Row(
          children: [
           
           
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(name.isNotEmpty ? name[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Color(0xff667EEA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,),),
                const Text('online',style: TextStyle(fontSize: 11),),
              ],
            ),


          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                'Call',
                'Calling $name...',
              );
            },
            icon: const Icon(Icons.call),
          ),

          IconButton(
            onPressed: () {
              Get.snackbar(
                'Video Call',
                'Video calling $name...',
              );
            },
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),

      body: Column(
        children: [
          // MESSAGES
          Expanded(
            child: StreamBuilder(
              stream: ctrl.messages.orderBy('time').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return Center(
                    child: Text('Start chatting with $name 👋',style: TextStyle(color: Colors.grey.shade600,),),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final text = data['text'] ?? '';
                    final isMe = data['senderId'] == ctrl.myUid;

                    return Align(
                      alignment: isMe ? Alignment.centerRight: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10,),
                        constraints: BoxConstraints(
                        maxWidth:MediaQuery.of(context).size.width * .75,
                        ),

                        decoration: BoxDecoration(
                          color: isMe? const Color(0xff667EEA): Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: Radius.circular(isMe ? 16 : 4,),
                            bottomRight: Radius.circular(isMe ? 4 : 16,),                         
                          ),
                        ),

                        child: Text(
                          text,
                          style: TextStyle(
                            color: isMe? Colors.white : Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // MESSAGE BOX
          SafeArea(
            top: false,

            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,

                  child: Row(
                    children: [
                      // TEXT FIELD
                      Expanded(
                        child: TextField(
                          controller: msgCtrl,
                          minLines: 1,
                          maxLines: 4,
                          textInputAction:TextInputAction.send,
                          onSubmitted: (_) => send(),
                          decoration: InputDecoration(hintText: 'Type a message...',
                            prefixIcon: Obx(
                              () => IconButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  showEmoji.toggle();
                                },

                                icon: Icon(showEmoji.value ? Icons.keyboard: Icons.emoji_emotions_outlined,color: const Color(0xff667EEA),),
                              ),
                            ),

                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                // ATTACHMENT
                                IconButton(
                                  onPressed: () {
                                    Get.bottomSheet(
                                      Container(
                                        padding:const EdgeInsets.all(20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:BorderRadius.vertical(
                                          top: Radius.circular(25),
                                          ),
                                        ),

                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                                        children: [          
                                            _option(Icons.photo,'Gallery',),
                                            _option(Icons.camera_alt,'Camera',),
                                            _option(Icons.insert_drive_file,'File',),
                                          ],
                                        ),


                                      ),
                                    );
                                  },

                                  icon: const Icon(Icons.attach_file,),
                                ),

                                // CAMERA
                                IconButton(
                                  onPressed: () {
                                    Get.snackbar('Camera','Camera clicked',);
                                  },
                                  icon: const Icon(Icons.camera_alt_outlined,),
                                ),


                              ],
                            ),

                            filled: true,
                            fillColor: const Color(0xffF1F2F6),

                            contentPadding:const EdgeInsets.symmetric(vertical: 12,),
                            border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 7),

                      // SEND / VOICE
                      CircleAvatar(
                        radius: 24,
                        backgroundColor:const Color(0xff667EEA),

                        child: IconButton(
                          onPressed: () {
                            if (msgCtrl.text.trim().isEmpty) {
                              Get.snackbar('Voice','Voice recording clicked',);
                            } 
                            else {
                              send();
                            }
                          },
                            icon: Icon(msgCtrl.text.trim().isEmpty? Icons.mic: Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),



                    ],
                  ),
                ),


                // EMOJI PICKER
                Obx(
                  () => showEmoji.value ? SizedBox(
                          height: 280,
                          child: EmojiPicker(
                            textEditingController: msgCtrl,
                            config: Config(
                              height: 280,
                              emojiViewConfig: const EmojiViewConfig( columns: 7,emojiSizeMax: 32,),
                              categoryViewConfig: const CategoryViewConfig(),
                              bottomActionBarConfig:const BottomActionBarConfig(),
                            ),  
                          ),
                        )

                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget _option( IconData icon, String title,) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.snackbar( title,'$title option clicked',);
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 28, backgroundColor: const Color(0xff667EEA),
            child: Icon(icon,color: Colors.white,),
          ),

          const SizedBox(height: 7),

          Text(title),
        ],
      ),
    );
  }
}